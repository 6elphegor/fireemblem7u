	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080041E4
sub_080041E4: @ 0x080041E4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08004218 @ =0x02024E1C
	ldrh r1, [r0, #4]
	ldr r0, [r7]
	cmp r0, r1
	beq _08004210
	bl sub_080034F4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _08004208
	movs r0, #0
	bl SetBgmVolume
_08004208:
	ldr r0, [r7]
	movs r1, #0
	bl StartBgmCore
_08004210:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004218: .4byte 0x02024E1C
