	.include "macro.inc"

	.syntax unified

	thumb_func_start EnlistTarget
EnlistTarget: @ 0x0804ACFC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r4, _0804AD48 @ =0x0203DCF8
	mov r8, r4
	ldr r6, _0804AD4C @ =0x0203DFF8
	ldr r5, [r6]
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #2
	add r4, r8
	strb r0, [r4]
	ldr r4, [r6]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	add r0, r8
	strb r1, [r0, #1]
	ldr r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	strb r2, [r0, #2]
	ldr r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	strb r3, [r0, #3]
	ldr r0, [r6]
	adds r0, #1
	str r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804AD48: .4byte 0x0203DCF8
_0804AD4C: .4byte 0x0203DFF8
