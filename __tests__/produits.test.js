/*
const request = require ('supertest');
const express = require('express');
const routeModule = require('../endpoint');
const db = require('../db.test');
const test = require("node:test"); //Bdd de test

const app = express();
app.use(express.json());
app.use('/api', routeModule);

describe('Endpoints pour les produits', () => {
    test('GET /api/produits devrait retourner tous les produits', async () => {
        const response = await request(app).get('/api/produits/');

        expect(response.status).toBe(200);
        expect(Array.isArray(response.body)).toBe(true);
        expect(response.body.length).toBeGreaterThan(0);
    });
})*/


const request = require("supertest");
const express = require("express");
const routeModule = require("../endpoint");
const { connect, close } = require("../db.test");
const { describe, it, beforeAll, afterAll } = require("@jest/globals");
const test = require("node:test"); // ✅ Utilisation correcte de Jest

const app = express();
app.use(express.json());
app.use("/api", routeModule);

describe("Endpoints pour les produits", () => {
    beforeAll(async () => {
        await connect();
    });

    afterAll(async () => {
        await close();
    });

    it("GET /api/produits devrait retourner tous les produits", async () => {
        const response = await request(app).get("/api/produits/");

        expect(response.status).toBe(200);
        expect(Array.isArray(response.body)).toBe(true);
        expect(response.body.length).toBeGreaterThan(0);
    });

    it("GET /api/produit/:id Doit retourner un produit", async () => {
        const productId = 1;
        const response = await request(app).get(`/api/produit/${productId}`);

        expect(response.status).toBe(200);
        /*expect(Array.isArray(response.body)).toBe(true);*/
        expect(response.body).toHaveProperty('Identifiant_produit');
        expect(response.body).toHaveProperty('Prix_ttc_produit');
        expect(response.body).toHaveProperty('Stock_produit');
    });

    it("GET /api/cafes Doit retourner les cafés", async () => {
        const productId = 1;
        const response = await request(app).get(`/api//produits/cafes`);

        expect(response.status).toBe(200);
        expect(Array.isArray(response.body)).toBe(true);
        expect(response.body.length).toBeGreaterThan(0);
    });
});

