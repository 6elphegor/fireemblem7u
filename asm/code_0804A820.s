	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804A820
sub_0804A820: @ 0x0804A820
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r5, [r0]
	ldr r7, [r5, #0x30]
	ldr r2, [r7, #0x18]
	cmp r2, #0
	beq _0804A848
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0804A848:
	ldr r0, _0804A86C @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804A870
	adds r0, r4, #0
	adds r1, r5, #0
	bl OverriddenMenuSelected
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xff
	bne _0804A8A6
	ldr r2, [r7, #0x14]
	b _0804A87C
	.align 2, 0
_0804A86C: .4byte 0x08B857F8
_0804A870:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804A88E
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #0x18]
_0804A87C:
	cmp r2, #0
	beq _0804A8A6
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0804A8A6
_0804A88E:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804A8A6
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	beq _0804A8A6
	adds r0, r4, #0
	bl _call_via_r1
_0804A8A6:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
