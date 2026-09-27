	.include "macro.inc"

	.syntax unified

	thumb_func_start GetMinimapRiverKindAt
GetMinimapRiverKindAt: @ 0x080A21A0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r3, #0
	ldr r2, _080A2240 @ =0x0202E3E0
	ldr r1, [r2]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x10
	beq _080A21CA
	cmp r0, #0x15
	beq _080A21CA
	cmp r0, #0x36
	beq _080A21CA
	cmp r0, #0x16
	beq _080A21CA
	cmp r0, #0x13
	bne _080A21CC
_080A21CA:
	adds r3, #1
_080A21CC:
	lsls r3, r3, #1
	ldr r0, [r2]
	lsls r1, r5, #2
	adds r0, r1, r0
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x10
	beq _080A21F0
	cmp r0, #0x15
	beq _080A21F0
	cmp r0, #0x36
	beq _080A21F0
	cmp r0, #0x16
	beq _080A21F0
	cmp r0, #0x13
	bne _080A21F2
_080A21F0:
	adds r3, #1
_080A21F2:
	lsls r3, r3, #1
	ldr r0, [r2]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r4, r0
	ldrb r0, [r0, #1]
	cmp r0, #0x10
	beq _080A2212
	cmp r0, #0x15
	beq _080A2212
	cmp r0, #0x36
	beq _080A2212
	cmp r0, #0x16
	beq _080A2212
	cmp r0, #0x13
	bne _080A2214
_080A2212:
	adds r3, #1
_080A2214:
	lsls r3, r3, #1
	ldr r0, [r2]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r4, r0
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x10
	beq _080A2236
	cmp r0, #0x15
	beq _080A2236
	cmp r0, #0x36
	beq _080A2236
	cmp r0, #0x16
	beq _080A2236
	cmp r0, #0x13
	bne _080A2238
_080A2236:
	adds r3, #1
_080A2238:
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A2240: .4byte 0x0202E3E0
