declare interface Response {
	Body: string;
	Headers: Record<string, string>;
	Status: number;
	StatusText: string;
	Ok: boolean;
	Url: string;
	Json(): LuaTuple<[boolean, unknown]>;
}

declare interface Options {
	Method?: "GET" | "POST" | "PUT" | "DELETE" | "PATCH" | "HEAD" | "OPTIONS" | "CONNECT" | "TRACE";
	Headers?: Record<string, string>;
	Body?: string | Record<string, unknown>;
}

declare function Fetch(resource: string, options?: Partial<Options>): Promise<Response>;

export = Fetch;
