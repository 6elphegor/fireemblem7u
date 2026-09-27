	.include "macro.inc"

	.syntax unified

	thumb_func_start BmMapInit
BmMapInit: @ 0x0801906C
	push {r4, r5, r6, r7, lr}
	mov ip, r1
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r2, _080190A8 @ =0x03000438
	str r0, [r2]
	adds r6, #2
	adds r5, #4
	lsls r1, r5, #2
	adds r4, r0, r1
	movs r3, #0
	adds r7, r2, #0
	cmp r3, r5
	bge _08019098
_08019088:
	ldr r1, [r2]
	lsls r0, r3, #2
	adds r0, r0, r1
	str r4, [r0]
	adds r4, r4, r6
	adds r3, #1
	cmp r3, r5
	blt _08019088
_08019098:
	ldr r0, [r7]
	adds r0, #8
	mov r1, ip
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080190A8: .4byte 0x03000438
