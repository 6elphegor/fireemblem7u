	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047CB8
sub_08047CB8: @ 0x08047CB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #5
	mov r8, r2
	cmp r3, #0
	ble _08047CEE
	movs r7, #0x80
	lsls r7, r7, #3
	adds r4, r3, #0
_08047CD0:
	mov r2, r8
	cmp r2, #0
	bge _08047CD8
	adds r2, #3
_08047CD8:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r6, #0
	adds r1, r5, #0
	bl CpuFastSet
	adds r6, r6, r7
	adds r5, r5, r7
	subs r4, #1
	cmp r4, #0
	bne _08047CD0
_08047CEE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
