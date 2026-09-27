	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08050650
sub_08050650: @ 0x08050650
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x10]
	movs r3, #0
	cmp r3, r4
	bhs _08050676
_0805065E:
	cmp r2, r5
	blo _08050664
	movs r2, #0
_08050664:
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	adds r3, #1
	adds r2, #1
	cmp r3, r4
	blo _0805065E
_08050676:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
