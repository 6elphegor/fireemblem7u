	.include "macro.inc"

	.syntax unified

	thumb_func_start ProcDanceAnim_Loop
ProcDanceAnim_Loop: @ 0x0802071C
	push {r4, lr}
	sub sp, #0x38
	adds r4, r0, #0
	ldr r1, _08020754 @ =0x081C3BF8
	mov r0, sp
	movs r2, #0x38
	bl memcpy
	adds r0, r4, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	lsls r0, r0, #2
	add r0, sp
	ldrb r1, [r0]
	ldrb r0, [r0, #1]
	cmp r1, #0xff
	bne _08020758
	adds r0, r4, #0
	bl Proc_Break
	b _08020772
	.align 2, 0
_08020754: .4byte 0x081C3BF8
_08020758:
	lsls r0, r0, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0802077C @ =0x0200323C
	adds r0, r0, r1
	ldr r1, _08020780 @ =0x02022C60
	movs r2, #6
	movs r3, #6
	bl TmCopyRect_thm
	movs r0, #1
	bl EnableBgSync
_08020772:
	add sp, #0x38
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802077C: .4byte 0x0200323C
_08020780: .4byte 0x02022C60
