# B'WIG'D Website

## Files Structure

### Production Files
- `index.html` - Main website file
- `model.gltf` - 3D model file
- `NoiGroteskTrial-Medium.ttf` - Font file
- `Mattone-Black.woff2`, `Mattone-Black.otf` - Mattone font
- `mazius-display-main/fonts/` - MaziusDisplay font files
- `bwigd-text.svg` - Logo SVG
- `bwigd-favi.svg`, `favicon.ico`, `icons/` - Favicon and app icon assets
- `gallery/` - Gallery images folder
- `site.webmanifest`, `robots.txt`, `sitemap.xml` - Launch metadata
- `_headers`, `_redirects` - Security headers and clean section URLs (`/gallery`, `/contact`, etc.)
- `build.sh` - Production bundle builder (output: `dist/`)
- `wrangler.toml` - Cloudflare Pages config
- `netlify.toml` - Netlify config (optional alternative host)

### Unused Files
- `unused/` - Contains all unused files (old versions, unused fonts, etc.)
- `index3.html` - Original development file (kept for reference)

## Cloudflare Pages (recommended)

1. Push this repo to GitHub.
2. In [Cloudflare Dashboard](https://dash.cloudflare.com) → **Workers & Pages** → **Create** → **Pages** → **Connect to Git**.
3. Select the repo. Build settings (usually auto-detected from `wrangler.toml` + `package.json`):
   - **Build command:** `npm run build` (or `./build.sh`)
   - **Build output directory:** `dist`
4. After the first deploy, go to **Custom domains** and add `bwigd.com.au` (and `www` if needed).
5. **DNS (GoDaddy or Cloudflare):**
   - If the domain uses **Cloudflare nameservers**, add the custom domain in Pages and approve the DNS records Cloudflare suggests.
   - If the domain stays on **GoDaddy**, either move nameservers to Cloudflare, or add the CNAME/A records Pages shows you at GoDaddy.

Every push to the connected branch redeploys the site.

## Netlify (optional)

**Manual build:**
```bash
./build.sh
```
Then deploy the `dist/` folder, or use `./build-netlify.sh` for a `netlify-deploy.zip` drag-and-drop bundle.

**Git deploy:** Connect the repo in Netlify; it uses `netlify.toml` (`./build.sh` → `dist/`).

## Features

- 3D rotating model with oscillation (60-110°)
- Gallery with responsive grid (4/3/2/1 columns)
- Contact page with fast 360° spin
- About page with scrollable content
- Mobile responsive design
