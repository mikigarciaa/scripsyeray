# Recibir las dos fechas

param(

    [datetime]$inicio,

    [datetime]$fin

)

# Buscar los inicios de sesion

$eventos = Get-WinEvent -FilterHashtable @{

    LogName = "Security"

    Id = 4624

    StartTime = $inicio

    EndTime = $fin.Date.AddDays(1).AddTicks(-1)

}

# Mostrar los eventos

foreach ($evento in $eventos) {

    # Obtener el usuario

    $usuario = $evento.Properties[5].Value

    # No mostrar el usuario SYSTEM

    if ($usuario -ne "SYSTEM") {

        Write-Output "Dia: $($evento.TimeCreated.ToString('dd/MM/yyyy'))"

        Write-Output "Hora: $($evento.TimeCreated.ToString('HH:mm:ss'))"

        Write-Output "Usuario: $usuario"

        Write-Output "-----------------------"

    }

}
