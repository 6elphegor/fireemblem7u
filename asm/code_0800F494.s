	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F494
sub_0800F494: @ 0x0800F494
	push {r4, r5, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F4B0
	ldr r4, _0800F4AC @ =0x0000FFFF
	ands r4, r2
	b _0800F4B4
	.align 2, 0
_0800F4AC: .4byte 0x0000FFFF
_0800F4B0:
	movs r4, #1
	rsbs r4, r4, #0
_0800F4B4:
	ldr r3, [r1, #0x30]
	ldrh r2, [r3, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800F4C8
	adds r5, r2, #0
_0800F4C8:
	ldr r2, [r3, #8]
	ldr r3, [r3, #0xc]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F4E4
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080B4F78
	movs r0, #2
	b _0800F4E6
_0800F4E4:
	movs r0, #0
_0800F4E6:
	pop {r4, r5}
	pop {r1}
	bx r1
