Attempt.destroy_all
UserBadge.destroy_all
Badge.destroy_all
Challenge.destroy_all
User.destroy_all

admin = User.create!(name: "Admin User", email: "admin@cyberrange.test", password: "Password123", password_confirmation: "Password123", role: "admin")
student = User.create!(name: "Demo Student", email: "student@cyberrange.test", password: "Password123", password_confirmation: "Password123", role: "student")

Badge.create!(name: "First Solve", description: "Awarded after the first correct challenge solve.", icon: "first")
Badge.create!(name: "Log Analyst", description: "Awarded after solving three Log Analysis challenges.", icon: "log")
Badge.create!(name: "Cyber Starter", description: "Awarded after reaching 100 points.", icon: "starter")

Challenge.create!(title: "Suspicious Login Attempt", category: "Log Analysis", difficulty: "Easy", points: 50, answer: "185.22.10.44", hint: "Look for repeated failed login attempts from the same IP address.", description: "Given this fake login log, identify the suspicious IP address.\n\n[2026-06-01 10:10] login success user=ali ip=192.168.1.10\n[2026-06-01 10:12] login failed user=admin ip=185.22.10.44\n[2026-06-01 10:13] login failed user=admin ip=185.22.10.44\n[2026-06-01 10:14] login failed user=admin ip=185.22.10.44")
Challenge.create!(title: "Fake Bank Email", category: "Phishing Awareness", difficulty: "Easy", points: 40, answer: "suspicious link", hint: "Focus on the link and the pressure in the message.", description: "A fake email says: Your bank account will be closed today. Click http://bank-login-example.fake-security.test now to verify. Identify the suspicious element.")
Challenge.create!(title: "Weak Password", category: "Password Security", difficulty: "Easy", points: 30, answer: "common password", hint: "The password appears in many common password lists.", description: "Why is the password 12345678 weak? This is a theory question only and does not involve password cracking.")
Challenge.create!(title: "Caesar Shift", category: "Basic Cryptography", difficulty: "Medium", points: 70, answer: "safe", hint: "Shift each letter three positions backward.", description: "Decode this Caesar cipher with shift 3: VDIH")
Challenge.create!(title: "Public Admin Panel", category: "Security Misconfiguration", difficulty: "Medium", points: 80, answer: "exposed admin panel", hint: "Think about unauthorized access risk.", description: "A training website leaves /admin visible to everyone without access controls. Identify the main security issue.")
Challenge.create!(title: "Security Awareness Quiz", category: "Cybersecurity Quiz", difficulty: "Easy", points: 25, answer: "report it", hint: "A student should not click suspicious links.", description: "If you receive a suspicious school email asking for your password, what should you do?")

puts "Seeded demo users, badges, and safe challenges."
