# Obtener los registros del sistema

$registros = @(Get-WinEvent -ListLog * -ErrorAction SilentlyContinue)

# Repetir el menu hasta elegir 0

do {

    Write-Host "===== MENU DE REGISTROS ====="

    # Mostrar los registros numerados

    for ($i = 0; $i -lt $registros.Count; $i++) {

        Write-Host "$($i + 1). $($registros[$i].LogName)"

    }

    Write-Host "0. Salir"

    # Pedir una opcion

    $opcion = Read-Host "Elige una opcion"

    # Comprobar si quiere salir

    if ($opcion -eq "0") {

        Write-Host "Saliendo del programa..."

        break

    }

    # Comprobar que la opcion sea valida

    $numero = 0

    if ([int]::TryParse($opcion, [ref]$numero) -and

        $numero -ge 1 -and

        $numero -le $registros.Count) {

        # Obtener el registro elegido

        $registro = $registros[$numero - 1]

        Write-Host "Registro: $($registro.LogName)"

        Write-Host "Total de eventos: $($registro.RecordCount)"

        # Mostrar los 12 ultimos eventos

        Get-WinEvent -LogName $registro.LogName -MaxEvents 12 -ErrorAction SilentlyContinue |

            Select-Object TimeCreated, Id, LevelDisplayName, Message |

            Format-Table -Wrap

    }

    else {

        Write-Host "Opcion no valida"

    }

    # Esperar antes de volver al menu

    Read-Host "Pulsa ENTER para continuar"

} while ($true)
