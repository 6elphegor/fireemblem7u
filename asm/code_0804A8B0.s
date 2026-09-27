	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804A8B0
sub_0804A8B0: @ 0x0804A8B0
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0x61
	adds r0, r0, r3
	mov ip, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r1, r3, #0
	adds r1, #0x34
	adds r0, r1, r0
	ldr r0, [r0]
	movs r5, #0x2a
	ldrsh r0, [r0, r5]
	lsls r0, r0, #3
	subs r0, #4
	str r0, [r4]
	mov r6, ip
	ldrb r6, [r6]
	lsls r0, r6, #2
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0x2c
	ldrsh r0, [r0, r1]
	lsls r0, r0, #3
	str r0, [r2]
	ldr r0, [r3, #0x30]
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0804A8F2
	ldr r0, [r4]
	subs r0, #4
	str r0, [r4]
_0804A8F2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
