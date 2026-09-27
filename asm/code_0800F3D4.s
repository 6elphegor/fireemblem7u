	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F3D4
sub_0800F3D4: @ 0x0800F3D4
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F3F0
	adds r0, r2, #0
	bl StartSlowLockingFadeToBlack
	movs r0, #2
	b _0800F410
_0800F3F0:
	ldr r2, _0800F414 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
_0800F410:
	pop {r1}
	bx r1
	.align 2, 0
_0800F414: .4byte 0x03002870
