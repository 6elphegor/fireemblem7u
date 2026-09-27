	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F944
sub_0800F944: @ 0x0800F944
	push {r4, r5, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F960
	ldr r4, _0800F95C @ =0x0000FFFF
	ands r4, r2
	b _0800F964
	.align 2, 0
_0800F95C: .4byte 0x0000FFFF
_0800F960:
	movs r4, #1
	rsbs r4, r4, #0
_0800F964:
	ldr r2, [r1, #0x30]
	ldrh r3, [r2, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800F978
	adds r5, r3, #0
_0800F978:
	ldr r2, [r2, #8]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F98E
	adds r0, r4, #0
	adds r1, r5, #0
	bl nullsub_5
_0800F98E:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
