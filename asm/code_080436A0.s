	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080436A0
sub_080436A0: @ 0x080436A0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _080436DC @ =0x02000C04
	ldr r2, _080436E0 @ =sub_08043690
	adds r0, r5, #0
	mov r1, sp
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080436F6
	ldrb r0, [r5, #4]
	cmp r0, #0
	bne _080436EC
	ldr r0, _080436E4 @ =0x06015000
	movs r1, #6
	bl LoadHelpBoxGfx
	ldr r2, _080436E8 @ =0x00001194
	movs r0, #0x38
	movs r1, #0x38
	bl StartHelpBoxExt_Unk
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080436F6
	.align 2, 0
_080436DC: .4byte 0x02000C04
_080436E0: .4byte sub_08043690
_080436E4: .4byte 0x06015000
_080436E8: .4byte 0x00001194
_080436EC:
	movs r0, #0
	str r0, [r4, #0x58]
	adds r0, r4, #0
	bl Proc_Break
_080436F6:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
