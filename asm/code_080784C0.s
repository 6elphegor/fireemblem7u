	.include "macro.inc"

	.syntax unified

	thumb_func_start EvCheck05_LOCA
EvCheck05_LOCA: @ 0x080784C0
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r4, [r3]
	ldr r1, [r4, #8]
	ldrb r2, [r4, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r5, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r1, r1, #0x10
	movs r6, #0
	str r6, [r3, #0x10]
	movs r0, #0x18
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bne _08078502
	movs r0, #0x19
	ldrsb r0, [r3, r0]
	cmp r5, r0
	bne _08078502
	ldr r0, [r4, #4]
	str r0, [r3, #4]
	ldrh r0, [r4, #2]
	str r0, [r3, #8]
	str r1, [r3, #0xc]
	cmp r1, #0x12
	bne _080784FE
	str r6, [r3, #0x14]
_080784FE:
	movs r0, #1
	b _08078504
_08078502:
	movs r0, #0
_08078504:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
