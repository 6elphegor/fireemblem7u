	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047A58
sub_08047A58: @ 0x08047A58
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r1, #0
	beq _08047A80
	ldr r0, _08047A7C @ =0x08B9A340
	bl Proc_StartBlocking
	b _08047A88
	.align 2, 0
_08047A7C: .4byte 0x08B9A340
_08047A80:
	ldr r0, _08047AAC @ =0x08B9A340
	movs r1, #2
	bl Proc_Start
_08047A88:
	adds r1, r0, #0
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	str r7, [r1, #0x34]
	mov r0, r8
	str r0, [r1, #0x38]
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x3c]
	adds r0, r1, #0
	adds r0, #0x41
	strb r4, [r0]
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08047AAC: .4byte 0x08B9A340
