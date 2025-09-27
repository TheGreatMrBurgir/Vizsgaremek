SegítsVelem

A SegítsVelem egy online platform, amely lehetővé teszi a rászorulók támogatását ruházati termékeken keresztül. A felhasználók regisztrálhatnak, böngészhetnek támogatási célokat (termékeket), leadhatják rendeléseiket, valamint kapcsolatba léphetnek az üzemeltetőkkel.
Csapattagok
- Szőke Simon – Frontend fejlesztés (Vue.js), vizuális megjelenés, oldalstruktúra, Backend fejlesztés(laravel), adatmodell, API, hitelesítés, hibakezelés, vezérlőlogika, CRUD műveletek


Technológiák

- Backend: Laravel 11, MySQL, Sanctum autentikáció, Mailable
- Frontend: Vue 3 + Vite, Axios, Vue Router, Bootstrap 5
- Tesztelés: PHPUnit (regisztráció, rendelés, hitelesítés)
- Adatbázis: MySQL – 6 tábla, relációkkal


Főbb mappák és fájlok



 `backend/`  Laravel alapú REST API 
 `frontend/`  Vue 3 alapú SPA felület 
 `database/migrations/`  Tábla definíciók 
 `app/Http/Controllers/`  Backend vezérlők 
 `tests/Feature/`  Backend tesztesetek 


Telepítési útmutató (fejlesztői gépre)

Backend (Laravel)

cd backend
composer install
copy .env.example .env
php artisan key:generate
php artisan migrate --seed
php artisan storage:link
php artisan serve

Frontend (Vue.js):
cd frontend
cd viewwebpage
npm install
npm run dev


megjegyzés:
a .env-ben található MAILGUN_API_KEY és
MAILGUN_DOMAIN-hoz tartozó kulcsot és domaint a készítőtől kell elkérni az email küldések működéséhez.