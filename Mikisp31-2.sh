# Recibir las fechas por parametros

param(

    [datetime]$inicio,

    [datetime]$fin

)

# Comprobar que la fecha inicial no sea mayor

if ($inicio -gt $fin) {

    Write-Host "Error: fechas incorrectas"

    exit

}

# Buscar los eventos de inicio de sesion

$eventos = Get-WinEvent -FilterHashtable @{

    LogName = "Security"

    Id = 4624

    StartTime = $inicio.Date

    EndTime = $fin.Date.AddDays(1).AddTicks(-1)

} -ErrorAction SilentlyContinue

# Recorrer los eventos encontrados

foreach ($evento in $eventos) {

    # Obtener el usuario del evento

    $usuario = $evento.Properties[5].Value

    # Excluir al usuario SYSTEM

    if ($usuario -ne "SYSTEM") {

        # Mostrar dia, hora y usuario

        Write-Host "Dia: $($evento.TimeCreated.ToString('dd/MM/yyyy')) - Hora: $($evento.TimeCreated.ToString('HH:mm:ss')) - Usuario: $usuario"

    }

}
