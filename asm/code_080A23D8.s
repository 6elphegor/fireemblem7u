	.include "macro.inc"

	.syntax unified

	thumb_func_start GetMinimapBridgeKindAt
GetMinimapBridgeKindAt: @ 0x080A23D8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r7, _080A2420 @ =0x0202E3E0
	ldr r0, [r7]
	lsls r6, r1, #2
	adds r2, r6, r0
	ldr r0, [r2]
	adds r0, r4, r0
	ldrb r1, [r0, #1]
	cmp r1, #0x13
	beq _080A241C
	subs r0, #1
	ldrb r3, [r0]
	cmp r3, #0x13
	beq _080A241C
	ldr r0, [r2, #4]
	adds r0, r0, r4
	ldrb r5, [r0]
	cmp r5, #0x13
	beq _080A242C
	subs r0, r2, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x13
	beq _080A242C
	cmp r1, #0x10
	beq _080A242C
	cmp r3, #0x10
	beq _080A242C
	cmp r5, #0x10
	beq _080A241C
	cmp r0, #0x10
	bne _080A2424
_080A241C:
	movs r0, #0x10
	b _080A244C
	.align 2, 0
_080A2420: .4byte 0x0202E3E0
_080A2424:
	cmp r1, #0x16
	beq _080A242C
	cmp r3, #0x16
	bne _080A2430
_080A242C:
	movs r0, #0x18
	b _080A244C
_080A2430:
	ldr r0, [r7]
	adds r1, r6, r0
	ldr r0, [r1, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x16
	beq _080A244A
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x16
	bne _080A244C
_080A244A:
	movs r0, #0x10
_080A244C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
