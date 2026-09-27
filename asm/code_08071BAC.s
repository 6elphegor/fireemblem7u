	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08071BAC
sub_08071BAC: @ 0x08071BAC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08071BCC @ =0x02023C60
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071BCC: .4byte 0x02023C60
