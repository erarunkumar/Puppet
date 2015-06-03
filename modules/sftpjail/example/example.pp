include sftpjail

        sftpjail::user{'stephen':
                udt => true,
                name => 'stephen',
                password => '$6$mmJbRAXH$yRu4Bqv9RPbrh2gQRjzj/Hg7x9Alo5svS8iMAm.gxaqRXp4OvP/R2pdO0DisOXZAUDinFQdGtTRnyZm6GTibU1',
        }
        sftpjail::user{'subir':
                name => 'subir',
                authorized_keys => 'ssh-rsa AAAAB3NzaC1Iyc2EAAAADAQABAAABAQDQgKHeOgcRiLEYDHYHnKzHb6cD8DdIl8HxGcNPNorI6hIKGRuh2s3Un1knjIYzfy52/hz4txQi4ax5eYtHdyC/D23hACI6BO7fXmI5nX7vyW1TT+xdowsVkNru6yD5bP+AqpcnQMwEo68BuL1NV7s4mv5I0jEOICnWms4l/N3jwk7Y3/yYyDzK4cDdZOl3dR4Re4CNKQrVjP3yaTTHvQHeoAyN6CZ73dig4/dslyJwuZu3vdsCZ5enpAGgJKKXXEOm/djd0NfJPdhnQdU7S4V5A4m/rB3f7B6OZVGfsyRg4q+Tjp9SAzk4tsUwKuhbuD+yGzjb6JRVJIj3fidwvBZz sandip@sandip-Latitude-E5540',
        }

