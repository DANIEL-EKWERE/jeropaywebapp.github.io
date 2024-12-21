'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "96e7b0492b5b8c03e86b4acbda3cd915",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "ab48b010afa41ccf7d8b644891d2e184",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/AssetManifest.bin": "9d5fd26c8f63e33b4e4e7482fa8df10b",
"assets/NOTICES": "050a6a311757419e303149509a7c2433",
"assets/fonts/MaterialIcons-Regular.otf": "5a40fa598980b824bda7ea266c9e3a07",
"assets/assets/images/paywithcardnbank.png": "4e87fdfc95a0ec606b33d3304c2f0645",
"assets/assets/images/PHED.png": "1240467ea72903b444f6c57d162b3fd6",
"assets/assets/images/splash%2520(1).png": "40427079fa7afdb651e2a94ce5bcaf0b",
"assets/assets/images/IBEDC.png": "5a6f12c7a818817bec3b8a96b05e1bce",
"assets/assets/images/becomeaseller.png": "e937528e6023120b1f426c629350c63a",
"assets/assets/images/home%2520(1).svg": "f17e115d9bdb49f1f3dc2f22a87a69ca",
"assets/assets/images/paystack.png": "4600351fdb39e838dbd692f57cc14631",
"assets/assets/images/reward.svg": "34599080bce965eeea6c4b5e56af5fb4",
"assets/assets/images/pic-2.png": "5013dfdc1f8223814c90faae1214efed",
"assets/assets/images/play_store_512.png": "83d03790731e6a9a941f5ed758e0943d",
"assets/assets/images/splash.png": "a739ef3834b4de07917a5648a4de3d6e",
"assets/assets/images/savemorespendless.png": "d4be2ae59f1d26dc9c77da16bc4c0991",
"assets/assets/images/history.svg": "dfca4a26120ea968cf0b4b0d464d8264",
"assets/assets/images/recharge-card-printer.png": "1f670fee6e80b57b78bef51b69ac9bc2",
"assets/assets/images/logo-1.png": "f03fe84aabd02a096b7789474f13566d",
"assets/assets/images/stay_connected.png": "59a26d240ff893615f94f8b3e1d9513f",
"assets/assets/images/payvessel.png": "6307e50d5039f4ac34d40faea949cd47",
"assets/assets/images/data.jpg": "11c0b53f3b62391ad77cb877f25443ab",
"assets/assets/images/JED.png": "4740360b5d0939f6c9115c2036e58419",
"assets/assets/images/graduation-cap.png": "c68935ed254e1c27f49b1a5bea977148",
"assets/assets/images/payfromhome.png": "cab7529973221cf0c65fa84fa0add99e",
"assets/assets/images/style.png": "4d668d74449bf5ea765d473a6b146418",
"assets/assets/images/networks.jpg": "57605de975de2a39c7813d7813d90687",
"assets/assets/images/AEDC.png": "b66628712e007b3fa5bf5e5af282028d",
"assets/assets/images/9mobile.png": "632682296c297dd995d0560f5d979f9a",
"assets/assets/images/glo.png": "ba54a8ee8061eced87aee9f188b17f50",
"assets/assets/images/styles2.png": "5a7ab9218d6ccac173459c8c19d8f4b7",
"assets/assets/images/data-pin.png": "f2822293981e84b4a5028e59f1a2b25d",
"assets/assets/images/profile%2520(1).svg": "ea6a2201b9d0009ac658d7da30aade72",
"assets/assets/images/contact-list.png": "423342a8df9ab3337ebc03107d8e34c1",
"assets/assets/images/forty_per_off.png": "3d4d96491ee7257a9f675a4a3983795e",
"assets/assets/images/EEDC.png": "f6a9629cc371e40f8f7b9485b101d50c",
"assets/assets/images/KAEDCO%2520(1).png": "eb3d5a1fc362fa6b1816f456ce0d0cfc",
"assets/assets/images/metaverse.png": "52bdfd6a56283701fb521b46e5f251bc",
"assets/assets/images/EKEDC.png": "ddf95f24c825611bd300b2329e206753",
"assets/assets/images/logo-1.svg": "85595b4585907919bfbc70e724b48163",
"assets/assets/images/cable.jpg": "d36bd06a60aa09004b36eebd08c98a18",
"assets/assets/images/IKEDC.png": "de880a9710a230acf30706e91d502054",
"assets/assets/images/sharewithfriends.png": "2fcf5394ad6e59d885ed8121bdb61015",
"assets/assets/images/all_networks.png": "7fac1c41d3223586393ae0b459db18b8",
"assets/assets/images/Monnify%2520-%2520logo.png": "ebd01791c4208949ef061fdac1c0e7b1",
"assets/assets/images/KAEDCO.png": "0076ddf36f191cd77b86b8bf782f40cc",
"assets/assets/images/receiptforall.png": "8bfa07a0626056368145e1ada0235a15",
"assets/assets/images/man-showing-heart-shape.png": "b456617cea9305aab3df684d3f935612",
"assets/assets/images/airtel.png": "114821a8f10968ea4f81498319e552ce",
"assets/assets/images/mtn.png": "a7e0f6db9f7c72b2382959cc8fab56fd",
"assets/AssetManifest.json": "015f8393c74e71422f3073cc1d1d4565",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter_bootstrap.js": "777a38705b0639337c5038871821a036",
"index.html": "12dc227dfefb9208b2cc1f226b31057e",
"/": "12dc227dfefb9208b2cc1f226b31057e",
"manifest.json": "20897aa112b0edf3bef689304477bb97",
"main.dart.js": "bef3d0bbfd8dc70ee7291837195bb29c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
