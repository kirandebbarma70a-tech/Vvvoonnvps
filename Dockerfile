FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# आवश्यक पैकेजेज इंस्टॉल करें
RUN apt-get update && \
    apt-get install -y systemd curl wget python3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Cloudflare Tunnel (cloudflared) डाउनलोड करें
RUN wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /usr/local/bin/cloudflared && \
    chmod +x /usr/local/bin/cloudflared

# रूट पासवर्ड सेट करें
RUN echo 'root:root' | chpasswd

# वर्किंग डायरेक्टरी बनाएं
WORKDIR /app

# अपनी वेबसाइट और स्क्रिप्ट कॉपी करें
COPY index.html /app/index.html
COPY start.sh /start.sh
RUN chmod +x /start.sh

# पोर्ट 80 (वेबपेज के लिए) खोलें
EXPOSE 80

# कंटेनर शुरू होने पर start.sh रन हो
CMD ["/start.sh"]
