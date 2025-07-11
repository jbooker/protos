/**
 * Generated by the protoc-gen-ts.  DO NOT EDIT!
 * compiler version: 4.24.3
 * source: chart.proto
 * git: https://github.com/thesayyn/protoc-gen-ts */
import * as pb_1 from "google-protobuf";
export enum Yearly {
    BY_DAY = 0,
    BY_WEEK = 1,
    BY_MONTH = 2
}
export class History extends pb_1.Message {
    #one_of_decls: number[][] = [];
    constructor(data?: any[] | {
        symbol?: string;
        candles?: Candle[];
    }) {
        super();
        pb_1.Message.initialize(this, Array.isArray(data) ? data : [], 0, -1, [2], this.#one_of_decls);
        if (!Array.isArray(data) && typeof data == "object") {
            if ("symbol" in data && data.symbol != undefined) {
                this.symbol = data.symbol;
            }
            if ("candles" in data && data.candles != undefined) {
                this.candles = data.candles;
            }
        }
    }
    get symbol() {
        return pb_1.Message.getFieldWithDefault(this, 1, "") as string;
    }
    set symbol(value: string) {
        pb_1.Message.setField(this, 1, value);
    }
    get candles() {
        return pb_1.Message.getRepeatedWrapperField(this, Candle, 2) as Candle[];
    }
    set candles(value: Candle[]) {
        pb_1.Message.setRepeatedWrapperField(this, 2, value);
    }
    static fromObject(data: {
        symbol?: string;
        candles?: ReturnType<typeof Candle.prototype.toObject>[];
    }): History {
        const message = new History({});
        if (data.symbol != null) {
            message.symbol = data.symbol;
        }
        if (data.candles != null) {
            message.candles = data.candles.map(item => Candle.fromObject(item));
        }
        return message;
    }
    toObject() {
        const data: {
            symbol?: string;
            candles?: ReturnType<typeof Candle.prototype.toObject>[];
        } = {};
        if (this.symbol != null) {
            data.symbol = this.symbol;
        }
        if (this.candles != null) {
            data.candles = this.candles.map((item: Candle) => item.toObject());
        }
        return data;
    }
    serialize(): Uint8Array;
    serialize(w: pb_1.BinaryWriter): void;
    serialize(w?: pb_1.BinaryWriter): Uint8Array | void {
        const writer = w || new pb_1.BinaryWriter();
        if (this.symbol.length)
            writer.writeString(1, this.symbol);
        if (this.candles.length)
            writer.writeRepeatedMessage(2, this.candles, (item: Candle) => item.serialize(writer));
        if (!w)
            return writer.getResultBuffer();
    }
    static deserialize(bytes: Uint8Array | pb_1.BinaryReader): History {
        const reader = bytes instanceof pb_1.BinaryReader ? bytes : new pb_1.BinaryReader(bytes), message = new History();
        while (reader.nextField()) {
            if (reader.isEndGroup())
                break;
            switch (reader.getFieldNumber()) {
                case 1:
                    message.symbol = reader.readString();
                    break;
                case 2:
                    reader.readMessage(message.candles, () => pb_1.Message.addToRepeatedWrapperField(message, 2, Candle.deserialize(reader), Candle));
                    break;
                default: reader.skipField();
            }
        }
        return message;
    }
    serializeBinary(): Uint8Array {
        return this.serialize();
    }
    static deserializeBinary(bytes: Uint8Array): History {
        return History.deserialize(bytes);
    }
}
export class Candle extends pb_1.Message {
    #one_of_decls: number[][] = [];
    constructor(data?: any[] | {
        date_time?: number;
        open?: number;
        close?: number;
        high?: number;
        low?: number;
        volume?: number;
    }) {
        super();
        pb_1.Message.initialize(this, Array.isArray(data) ? data : [], 0, -1, [], this.#one_of_decls);
        if (!Array.isArray(data) && typeof data == "object") {
            if ("date_time" in data && data.date_time != undefined) {
                this.date_time = data.date_time;
            }
            if ("open" in data && data.open != undefined) {
                this.open = data.open;
            }
            if ("close" in data && data.close != undefined) {
                this.close = data.close;
            }
            if ("high" in data && data.high != undefined) {
                this.high = data.high;
            }
            if ("low" in data && data.low != undefined) {
                this.low = data.low;
            }
            if ("volume" in data && data.volume != undefined) {
                this.volume = data.volume;
            }
        }
    }
    get date_time() {
        return pb_1.Message.getFieldWithDefault(this, 1, 0) as number;
    }
    set date_time(value: number) {
        pb_1.Message.setField(this, 1, value);
    }
    get open() {
        return pb_1.Message.getFieldWithDefault(this, 2, 0) as number;
    }
    set open(value: number) {
        pb_1.Message.setField(this, 2, value);
    }
    get close() {
        return pb_1.Message.getFieldWithDefault(this, 3, 0) as number;
    }
    set close(value: number) {
        pb_1.Message.setField(this, 3, value);
    }
    get high() {
        return pb_1.Message.getFieldWithDefault(this, 4, 0) as number;
    }
    set high(value: number) {
        pb_1.Message.setField(this, 4, value);
    }
    get low() {
        return pb_1.Message.getFieldWithDefault(this, 5, 0) as number;
    }
    set low(value: number) {
        pb_1.Message.setField(this, 5, value);
    }
    get volume() {
        return pb_1.Message.getFieldWithDefault(this, 6, 0) as number;
    }
    set volume(value: number) {
        pb_1.Message.setField(this, 6, value);
    }
    static fromObject(data: {
        date_time?: number;
        open?: number;
        close?: number;
        high?: number;
        low?: number;
        volume?: number;
    }): Candle {
        const message = new Candle({});
        if (data.date_time != null) {
            message.date_time = data.date_time;
        }
        if (data.open != null) {
            message.open = data.open;
        }
        if (data.close != null) {
            message.close = data.close;
        }
        if (data.high != null) {
            message.high = data.high;
        }
        if (data.low != null) {
            message.low = data.low;
        }
        if (data.volume != null) {
            message.volume = data.volume;
        }
        return message;
    }
    toObject() {
        const data: {
            date_time?: number;
            open?: number;
            close?: number;
            high?: number;
            low?: number;
            volume?: number;
        } = {};
        if (this.date_time != null) {
            data.date_time = this.date_time;
        }
        if (this.open != null) {
            data.open = this.open;
        }
        if (this.close != null) {
            data.close = this.close;
        }
        if (this.high != null) {
            data.high = this.high;
        }
        if (this.low != null) {
            data.low = this.low;
        }
        if (this.volume != null) {
            data.volume = this.volume;
        }
        return data;
    }
    serialize(): Uint8Array;
    serialize(w: pb_1.BinaryWriter): void;
    serialize(w?: pb_1.BinaryWriter): Uint8Array | void {
        const writer = w || new pb_1.BinaryWriter();
        if (this.date_time != 0)
            writer.writeInt64(1, this.date_time);
        if (this.open != 0)
            writer.writeDouble(2, this.open);
        if (this.close != 0)
            writer.writeDouble(3, this.close);
        if (this.high != 0)
            writer.writeDouble(4, this.high);
        if (this.low != 0)
            writer.writeDouble(5, this.low);
        if (this.volume != 0)
            writer.writeDouble(6, this.volume);
        if (!w)
            return writer.getResultBuffer();
    }
    static deserialize(bytes: Uint8Array | pb_1.BinaryReader): Candle {
        const reader = bytes instanceof pb_1.BinaryReader ? bytes : new pb_1.BinaryReader(bytes), message = new Candle();
        while (reader.nextField()) {
            if (reader.isEndGroup())
                break;
            switch (reader.getFieldNumber()) {
                case 1:
                    message.date_time = reader.readInt64();
                    break;
                case 2:
                    message.open = reader.readDouble();
                    break;
                case 3:
                    message.close = reader.readDouble();
                    break;
                case 4:
                    message.high = reader.readDouble();
                    break;
                case 5:
                    message.low = reader.readDouble();
                    break;
                case 6:
                    message.volume = reader.readDouble();
                    break;
                default: reader.skipField();
            }
        }
        return message;
    }
    serializeBinary(): Uint8Array {
        return this.serialize();
    }
    static deserializeBinary(bytes: Uint8Array): Candle {
        return Candle.deserialize(bytes);
    }
}
