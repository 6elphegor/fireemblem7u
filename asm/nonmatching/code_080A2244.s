	.include "macro.inc"

	.syntax unified

	thumb_func_start GetMinimapCliffKindAt
GetMinimapCliffKindAt: @ 0x080A2244
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _080A227C @ =0x0202E3E0
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r2, r0, r4
	ldrb r3, [r2]
	subs r0, r2, #1
	ldrb r6, [r0]
	cmp r6, r3
	beq _080A2264
	ldrb r5, [r2, #1]
	cmp r5, r3
	bne _080A229E
_080A2264:
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r2, [r0]
	cmp r2, #0x15
	beq _080A2278
	cmp r2, #0x36
	beq _080A2278
	cmp r2, #0x16
	bne _080A2280
_080A2278:
	movs r0, #4
	b _080A2364
	.align 2, 0
_080A227C: .4byte 0x0202E3E0
_080A2280:
	ldr r0, [r1, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x15
	beq _080A2292
	cmp r0, #0x36
	beq _080A2292
	cmp r0, #0x16
	bne _080A2296
_080A2292:
	movs r0, #0
	b _080A2364
_080A2296:
	cmp r2, #0xf
	bne _080A2362
	movs r0, #0xc
	b _080A2364
_080A229E:
	subs r0, r1, #4
	ldr r0, [r0]
	adds r2, r0, r4
	ldrb r0, [r2]
	cmp r0, r3
	beq _080A22B4
	ldr r0, [r1, #4]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, r3
	bne _080A22E4
_080A22B4:
	adds r0, r5, #0
	cmp r0, #0x15
	beq _080A22C2
	cmp r0, #0x36
	beq _080A22C2
	cmp r0, #0x16
	bne _080A22C6
_080A22C2:
	movs r0, #2
	b _080A2364
_080A22C6:
	adds r1, r6, #0
	cmp r1, #0x15
	beq _080A22D4
	cmp r1, #0x36
	beq _080A22D4
	cmp r1, #0x16
	bne _080A22D8
_080A22D4:
	movs r0, #6
	b _080A2364
_080A22D8:
	cmp r0, #0xf
	bne _080A22E0
	movs r0, #0xd
	b _080A2364
_080A22E0:
	movs r0, #9
	b _080A2364
_080A22E4:
	subs r0, r1, #1
	ldrb r5, [r0]
	cmp r5, r3
	beq _080A22F2
	ldrb r4, [r2, #1]
	cmp r4, r3
	bne _080A2324
_080A22F2:
	subs r0, r2, #1
	ldrb r2, [r0]
	cmp r2, #0x15
	beq _080A2302
	cmp r2, #0x36
	beq _080A2302
	cmp r2, #0x16
	bne _080A2306
_080A2302:
	movs r0, #5
	b _080A2364
_080A2306:
	ldrb r0, [r1, #1]
	cmp r0, #0x15
	beq _080A2314
	cmp r0, #0x36
	beq _080A2314
	cmp r0, #0x16
	bne _080A2318
_080A2314:
	movs r0, #1
	b _080A2364
_080A2318:
	cmp r2, #0xf
	bne _080A2320
	movs r0, #0xe
	b _080A2364
_080A2320:
	movs r0, #0xa
	b _080A2364
_080A2324:
	ldrb r1, [r1, #1]
	cmp r1, r3
	beq _080A2332
	subs r0, r2, #1
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A2362
_080A2332:
	adds r1, r4, #0
	cmp r1, #0x15
	beq _080A2340
	cmp r1, #0x36
	beq _080A2340
	cmp r1, #0x16
	bne _080A2344
_080A2340:
	movs r0, #3
	b _080A2364
_080A2344:
	adds r0, r5, #0
	cmp r0, #0x15
	beq _080A2352
	cmp r0, #0x36
	beq _080A2352
	cmp r0, #0x16
	bne _080A2356
_080A2352:
	movs r0, #7
	b _080A2364
_080A2356:
	cmp r1, #0xf
	bne _080A235E
	movs r0, #0xf
	b _080A2364
_080A235E:
	movs r0, #0xb
	b _080A2364
_080A2362:
	movs r0, #8
_080A2364:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
