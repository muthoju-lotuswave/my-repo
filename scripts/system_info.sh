#!/bin/bash
echo "===== Memory Info (free -h) ====="
free -h

echo ""
echo "===== Running Processes (ps aux) ====="
ps aux

echo ""
echo "===== Full Process List (ps -ef) ====="
ps -ef
