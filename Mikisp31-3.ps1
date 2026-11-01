# Obtener los registros disponibles

$registros = @(Get-WinEvent -ListLog * -ErrorAction SilentlyContinue)

$opcion = -1

# Repetir hasta pulsar 0

while ($opcion -ne "0") {

    Write-Output "===== MENU ====="

    # Mostrar los registros

    for ($i = 0; $i -lt $registros.Count; $i++) {

        Write-Output "$($i + 1). $($registros[$i].LogName)"

    }

    Write-Output "0. Salir"

    # Pedir una opcion

    $opcion = Read-Host "Elige una opcion"

    if ($opcion -eq "0") {

        Write-Output "Fin del programa"

    }

    elseif ($opcion -match '^[0-9]+$' -and

            [int]$opcion -ge 1 -and

            [int]$opcion -le $registros.Count) {

        # Seleccionar el registro

        $registro = $registros[[int]$opcion - 1]

        # Mostrar la cantidad de eventos

        Write-Output "Registro: $($registro.LogName)"

        Write-Output "Total: $($registro.RecordCount)"

        # Mostrar los 12 ultimos eventos

        Get-WinEvent -LogName $registro.LogName -MaxEvents 12 -ErrorAction SilentlyContinue |

            Select-Object TimeCreated, Id, LevelDisplayName

    }

    else {

        Write-Output "Opcion no valida"

    }

    Read-Host "Pulsa ENTER para continuar"

}
