	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805BF94
sub_0805BF94: @ 0x0805BF94
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805BFEC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BFF0 @ =0x08BA2D60
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	adds r5, r0, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _0805BFF4 @ =0x08BA14DC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r4, #0x60]
	ldr r0, _0805BFF8 @ =0x0000F3FF
	ldrh r1, [r6, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805BFFC
	ldrh r0, [r6, #2]
	subs r0, #8
	b _0805C000
	.align 2, 0
_0805BFEC: .4byte 0x0201774C
_0805BFF0: .4byte 0x08BA2D60
_0805BFF4: .4byte 0x08BA14DC
_0805BFF8: .4byte 0x0000F3FF
_0805BFFC:
	ldrh r0, [r6, #2]
	adds r0, #8
_0805C000:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	subs r0, #0x10
	strh r0, [r6, #4]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
