	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F424
sub_0800F424: @ 0x0800F424
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F440
	ldr r3, _0800F43C @ =0x0000FFFF
	ands r3, r2
	b _0800F444
	.align 2, 0
_0800F43C: .4byte 0x0000FFFF
_0800F440:
	movs r3, #1
	rsbs r3, r3, #0
_0800F444:
	ldr r0, [r1, #0x30]
	ldrh r2, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, #0
	bne _0800F458
	adds r4, r2, #0
_0800F458:
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F470
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_080B4F74
	movs r0, #2
	b _0800F472
_0800F470:
	movs r0, #0
_0800F472:
	pop {r4}
	pop {r1}
	bx r1
