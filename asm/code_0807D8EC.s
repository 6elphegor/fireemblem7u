	.include "macro.inc"

	.syntax unified

	thumb_func_start EventCall_SwingSwordfx
EventCall_SwingSwordfx: @ 0x0807D8EC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807D904
	adds r0, r2, #0
	bl StartSwingSwordfx
_0807D904:
	pop {r0}
	bx r0
