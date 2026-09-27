	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807821C
sub_0807821C: @ 0x0807821C
	push {r4, r5, r6, lr}
	movs r3, #0
	ldr r1, _08078240 @ =0x0202BBB8
	ldrb r5, [r1, #0x14]
	ldrb r4, [r1, #0x16]
	adds r6, r4, #0
	ldr r0, [r0]
	ldr r2, [r0, #4]
	cmp r2, #0
	beq _0807829C
	ldrh r0, [r0]
	cmp r0, #0xf
	beq _08078244
	cmp r0, #0x10
	beq _0807826C
_0807823A:
	movs r0, #1
	b _080782B2
	.align 2, 0
_08078240: .4byte 0x0202BBB8
_08078244:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _080782B0
_0807824A:
	lsls r0, r3, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	cmp r5, r1
	bne _0807825A
	ldrb r0, [r0, #1]
	cmp r6, r0
	beq _0807823A
_0807825A:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0807824A
	b _080782B0
_0807826C:
	ldr r0, _08078298 @ =0x0202E3E4
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi _080782B0
	ldrb r0, [r2]
	cmp r5, r0
	blo _080782B0
	ldrb r1, [r2, #1]
	cmp r4, r1
	blo _080782B0
	ldrb r0, [r2, #4]
	cmp r5, r0
	bhi _080782B0
	ldrb r2, [r2, #5]
	cmp r4, r2
	bhi _080782B0
	b _0807823A
	.align 2, 0
_08078298: .4byte 0x0202E3E4
_0807829C:
	ldr r0, _080782B8 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	cmp r5, r0
	bne _080782B0
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	cmp r6, r0
	beq _0807823A
_080782B0:
	movs r0, #0
_080782B2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080782B8: .4byte 0x03004690
