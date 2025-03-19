self.importScripts('https://cdn.jsdelivr.net/npm/sqflite_common_ffi_web/assets/sqflite_sw.js');

self.addEventListener('install', function(event) {
  console.log('Service Worker installing.');
  event.waitUntil(self.skipWaiting());
});

self.addEventListener('activate', function(event) {
  console.log('Service Worker activated.');
  event.waitUntil(self.clients.claim());
});
