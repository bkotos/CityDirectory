package io.kotos;

class Municipality
{
    private int municipalityId;

    private String name;

    private String type;

    public int getMunicipalityId() {
        return municipalityId;
    }

    public Municipality setMunicipalityId(int municipalityId) {
        this.municipalityId = municipalityId;

        return this;
    }

    public String getName() {
        return name;
    }

    public Municipality setName(String name) {
        this.name = name;

        return this;
    }

    public String getType() {
        return type;
    }

    public Municipality setType(String type) {
        this.type = type;

        return this;
    }
}
