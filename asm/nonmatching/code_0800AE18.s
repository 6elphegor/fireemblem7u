	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800AE18
sub_0800AE18: @ 0x0800AE18
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x14]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800AE30
	adds r0, r2, #0
	bl StartMidLockingFadeToBlack
_0800AE30:
	pop {r0}
	bx r0
