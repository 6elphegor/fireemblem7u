	.include "macro.inc"

	.syntax unified

	thumb_func_start AddLightRune
AddLightRune: @ 0x0802C1E8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0802C218 @ =0x0202E3E0
	ldr r0, [r6]
	lsls r4, r1, #2
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r3, [r0]
	adds r0, r5, #0
	movs r2, #0xc
	bl AddTrap
	movs r2, #0
	movs r1, #3
	strb r1, [r0, #6]
	ldr r0, [r6]
	adds r4, r4, r0
	ldr r0, [r4]
	adds r0, r0, r5
	strb r2, [r0]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802C218: .4byte 0x0202E3E0
