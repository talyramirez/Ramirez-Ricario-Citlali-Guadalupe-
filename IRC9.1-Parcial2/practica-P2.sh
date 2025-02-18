
#!/bin/bash

LOG_DIR="/var/log/ssh_command_logs"
mkdir -p "$LOG_DIR"

USER=$(whoami)
SESSION_ID=$(date +"%Y%m%d_%H%M%S")_"$USER"
LOG_FILE="$LOG_DIR/session_$SESSION_ID.log"

echo "Registro de sesión SSH para $USER iniciado en $LOG_FILE"

# Registrar cada comando ejecutado
export PROMPT_COMMAND='echo "$(date +"%Y-%m-%d %H:%M:%S") - $(who am i | awk "{print \$1}") - $(history 1)" >> '"$LOG_FILE"

# Mantener la sesión hasta que el usuario salga
bash --noprofile --norc

echo "Sesión finalizada y registrada en $LOG_FILE"
