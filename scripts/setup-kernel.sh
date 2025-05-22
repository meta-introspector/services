# setup kernel
# source https://gist.github.com/Sparky-web/7439746c78419007f4d591b573614164
bash -c "cat >/etc/sysctl.d/20-solana-additionals.conf <<EOF
kernel.nmi_watchdog=0
kernel.sched_min_granularity_ns='10000000'
kernel.sched_wakeup_granularity_ns='15000000'
vm.swappiness='30'
kernel.hung_task_timeout_secs=600
vm.stat_interval=10
vm.dirty_ratio=40
vm.dirty_background_ratio=10
vm.dirty_expire_centisecs=36000
vm.dirty_writeback_centisecs=3000
vm.dirtytime_expire_seconds=43200
kernel.timer_migration=0
kernel.pid_max=65536
net.ipv4.tcp_fastopen=3
EOF"

bash -c "cat >/etc/sysctl.d/20-solana-mmaps.conf <<EOF
# Increase memory mapped files limit
vm.max_map_count = 1000000
EOF"

bash -c "cat >/etc/sysctl.d/20-solana-udp-buffers.conf <<EOF
# Increase UDP buffer size
net.core.rmem_default = 134217728
net.core.rmem_max = 134217728
net.core.wmem_default = 134217728
net.core.wmem_max = 134217728
EOF"

sysctl -p /etc/sysctl.d/20-solana-mmaps.conf
sysctl -p /etc/sysctl.d/20-solana-udp-buffers.conf
sysctl -p /etc/sysctl.d/20-solana-additionals.conf