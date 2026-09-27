	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804362C
sub_0804362C: @ 0x0804362C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _08043654 @ =0x02000C00
	ldr r2, _08043658 @ =sub_08043618
	adds r0, r4, #0
	mov r1, sp
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804367E
	ldrb r0, [r4]
	cmp r0, #0
	bne _0804365C
	adds r0, r5, #0
	bl Proc_Break
	b _0804367E
	.align 2, 0
_08043654: .4byte 0x02000C00
_08043658: .4byte sub_08043618
_0804365C:
	cmp r0, #0
	blt _0804367E
	cmp r0, #2
	bgt _0804367E
	ldr r0, _08043688 @ =0x06015000
	movs r1, #6
	bl LoadHelpBoxGfx
	ldr r2, _0804368C @ =0x00001193
	movs r0, #0x38
	movs r1, #0x38
	bl StartHelpBoxExt_Unk
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
_0804367E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043688: .4byte 0x06015000
_0804368C: .4byte 0x00001193
