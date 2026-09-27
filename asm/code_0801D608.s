	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMapFade
StartMapFade: @ 0x0801D608
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0801D630 @ =0x08B9362C
	movs r1, #3
	bl Proc_Start
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, #0x4e
	strh r4, [r0]
	cmp r4, #0
	beq _0801D628
	bl LockGame
_0801D628:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D630: .4byte 0x08B9362C
