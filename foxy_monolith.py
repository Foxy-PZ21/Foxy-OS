import requests
import os
import time
import re
from collections import Counter

TOKEN = "8381723831:AAGeUosxGHOgm3V6wE2anH118cMH1FU7kzc"
CHAT_ID = "1929821752"

def get_targets_dict():
    log_path = "/var/log/auth.log"
    if not os.path.exists(log_path): return []
    
    with os.popen(f"tail -n 500 {log_path}") as f:
        log_data = f.read()

    failed_ips = re.findall(r"Failed password .* from ([\d\.]+) ", log_data)
    counts = Counter(failed_ips)
    return {ip: count for ip, count in counts.items() if count >= 5}
targets = get_targets_dict()
    
def send_to_ayugram(message):
    """ Sends a report to AyuGram """
    url = f"https://api.telegram.org/bot{TOKEN}/sendMessage"
    
    # Формируем данные БЕЗ сложных разметок для начала
    payload = {
        "chat_id": CHAT_ID,
        "text": f"🛡️ MONOLITH REPORT:\n{message}", 
        "parse_mode": "HTML"
    }
    
    response = requests.post(url, json=payload)
    
    if response.status_code == 200:
        print("✅ Monolith is online!")
    else:
        # If silent — terminal will write why
        print(f"❌ Error in Monolith: {response.status_code} - {response.text}")

def security_scan():
    print("--- [ MONOLITH: SCANING STARTED ] ---:")
    time.sleep(1)

    banned_list = []

    for ip, attempts in targets.items():
        print(f"Target: {ip}, Attempts: {attempts}")
        if attempts >= 5:
            print(f"[!] THREAT DETECTED: {ip} ({attempts} attempts)")
            banned_list.append(ip)
        else:
            print(f"[+] Clear: {ip}")

    if banned_list:
        report = "*ATTENTION!* Anomalies detected:\n"
        report += "Next objects transferred to the system SHIELD:\n"
        for ip in banned_list:
            report += f"❌ `{ip}`\n"

        send_to_ayugram(report)

        for ip in banned_list:
            print(f"I send the command SHIELD to ban {ip}...")
            os.system(f"bash /home/foxy/foxy-admin/security/foxy-shield.sh")
        else:
            print("System stable. Threat not detected.") 
if __name__ == "__main__":              
    security_scan()