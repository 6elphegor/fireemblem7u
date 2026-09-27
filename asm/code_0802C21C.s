	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802C21C
sub_0802C21C: @ 0x0802C21C
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl sub_080193BC
	ldr r1, _0802C248 @ =0x0202E3E0
	ldr r2, [r1]
	ldrb r3, [r4, #1]
	lsls r1, r3, #2
	adds r1, r1, r2
	ldr r1, [r1]
	ldrb r2, [r4]
	adds r1, r2, r1
	strb r0, [r1]
	adds r0, r4, #0
	bl RemoveTrap
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802C248: .4byte 0x0202E3E0
