local issues = {
  [123] = 'Ini adalah deskripsi issue #123',
  [456] = 'Ini issue #456, fix typo',
}

local function HoverCustomIssue()
  local current_word = vim.fn.expand '<CWORD>'
  local isIssueNum = string.match(current_word, '^#%(%d+)%$')
  local issueNum = vim.fn.expand '<cword>'
  vim.lsp.util.open_floating_preview({ [[
---
title: "📄 Sprint 12: pages content"
url: https://github.com/muryp/bandhaku/issues/13
updatedAt: 2025-06-04T09:35:10Z
status: OPEN
milestone: null
createdAt: "2025-06-04T08:26:16Z"
labels:
  - id: LA_kwDOOixyc88AAAACCAjw7Q
    description: New feature or request
    name: feature
    color: 0e8a16
  - id: LA_kwDOOixyc88AAAACCAjzFw
    description: User interface and design
    name: ui
    color: 1d9bf0
  - id: LA_kwDOOixyc88AAAACCAjzyQ
    description: Frontend client side
    name: frontend
    color: 4a90e2
author:
  id: MDQ6VXNlcjY5Nzc2MzQ3
  is_bot: false
  name: Alief Prihantoro
  login: aliefprihantoro
assignees:
  - id: MDQ6VXNlcjY5Nzc2MzQ3
    name: Alief Prihantoro
    login: aliefprihantoro
reactionGroups: []
closedAt: null

---
<!--
how use it:
- Ghissue <core-cmd>
see README for more info

NOTE : puth text under comment(all comment eddit is no effect )
-->

## 🎯 **Tujuan**

- Menyediakan **informasi lengkap** agar user & calon customer paham value app.
- Menyiapkan halaman **legal** (privacy policy, dsb).
- Membantu SEO & profesionalitas.

## 📝 **TODO / Daftar Pekerjaan Sprint 12**

### 📜 **Landing Page**

- [ ] Buat hero section (headline, tagline)
- [ ] Tambahkan CTA (sign up / download app)
- [ ] Tambahkan animasi / ilustrasi (opsional)
- [ ] Buat section “Keunggulan Aplikasi” (misalnya: sync data offline/online, manajemen aset, dll)

### 💰 **Pricing Page**

- [ ] Buat halaman harga (opsional: Free / Premium)
- [ ] Jelas & transparan (biaya, fitur)

### ❓ **How to Use Page**

- [ ] Buat halaman “Cara Menggunakan” / tutorial ringkas
- [ ] Bisa berupa teks / video embed / GIF

### 📑 **Legal Pages**

- [ ] Buat halaman “Privacy Policy” (GDPR-ready kalau target Eropa)
- [ ] Buat halaman “Terms of Service” (opsional)
- [ ] Tambahkan link di footer

### 💬 **FAQ (QnA)**

- [ ] Buat halaman pertanyaan umum (QnA)
- [ ] Contoh:
  - “Bagaimana data saya disimpan?”
  - “Bagaimana saya upgrade akun?”
- [ ] Buat tabel / accordion untuk navigasi

### ⭐ **Rating & Feedback**

- [ ] Tambahkan form rating (opsional: 1–5 bintang)
- [ ] Simpan feedback ke Firestore (opsional)
- [ ] Tampilkan testimonial user (kalau ada)

## 🗂️ **Checklist Deployment**

- [ ] Deploy semua halaman statis ke Netlify
- [ ] Tambahkan sitemap (untuk SEO, opsional)
- [ ] Tambahkan favicon & meta tags (SEO & branding)
- [ ] Tambahkan link footer ke legal pages
  ]] }, 'markdown',{title_pos='center'})

  if isIssueNum then
    print(issueNum)
    local num = tonumber(isIssueNum)
    local desc = issues[num]

    if desc then
      -- Tampilkan popup hover di atas kursor
      vim.lsp.util.open_floating_preview({ desc }, 'markdown', { border = 'single' })
    else
      vim.lsp.util.open_floating_preview(
        { '**Issue #' .. num .. '** tidak ditemukan.' },
        'markdown',
        { border = 'single' }
      )
    end
  else
    print(current_word)
  end
end

-- #123
vim.keymap.set('n', 'L', HoverCustomIssue, { noremap = false, silent = true })