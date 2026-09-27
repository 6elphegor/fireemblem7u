	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080133C8
sub_080133C8: @ 0x080133C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r6, [sp, #0x18]
	cmp r4, r6
	ble _080133E6
	adds r1, r3, #0
	adds r3, r5, #0
	adds r5, r1, #0
	adds r1, r6, #0
	adds r6, r4, #0
	adds r4, r1, #0
_080133E6:
	subs r0, r3, r5
	lsls r0, r0, #0x10
	subs r1, r6, r4
	bl __divsi3
	mov ip, r0
	lsls r5, r5, #0x10
	cmp r6, #0xa0
	ble _080133FA
	movs r6, #0xa0
_080133FA:
	cmp r4, #0
	bge _0801340A
	rsbs r0, r4, #0
	mov r1, ip
	muls r1, r0, r1
	adds r0, r1, #0
	adds r5, r5, r0
	movs r4, #0
_0801340A:
	cmp r4, r6
	bge _08013444
	lsls r0, r4, #2
	mov r2, r8
	adds r1, r0, r2
	adds r2, r1, #0
_08013416:
	asrs r3, r5, #0x10
	cmp r3, #0xf0
	ble _0801341E
	movs r3, #0xf0
_0801341E:
	cmp r3, #0
	bge _08013424
	movs r3, #0
_08013424:
	movs r7, #0
	ldrsh r0, [r1, r7]
	cmp r0, r3
	ble _0801342E
	strh r3, [r1]
_0801342E:
	movs r7, #2
	ldrsh r0, [r2, r7]
	cmp r0, r3
	bge _08013438
	strh r3, [r2, #2]
_08013438:
	add r5, ip
	adds r1, #4
	adds r2, #4
	adds r4, #1
	cmp r4, r6
	blt _08013416
_08013444:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
