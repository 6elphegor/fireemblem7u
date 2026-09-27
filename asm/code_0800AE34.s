	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800AE34
sub_0800AE34: @ 0x0800AE34
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x14]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800AE4C
	adds r0, r2, #0
	bl StartMidLockingFadeFromBlack
_0800AE4C:
	pop {r0}
	bx r0
