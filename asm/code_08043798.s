	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043798
sub_08043798: @ 0x08043798
	push {r4, r5, lr}
	sub sp, #0x28
	adds r5, r0, #0
	ldr r4, _080437F8 @ =0x02000C1C
	add r1, sp, #0x24
	ldr r2, _080437FC @ =sub_08043788
	adds r0, r4, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804381E
	bl CloseHelpBox
	movs r0, #0
	bl sub_0803D500
	ldr r0, _08043800 @ =0x06016800
	movs r1, #0xd
	bl LoadHelpBoxGfx
	ldr r2, _08043804 @ =0x00001195
	movs r0, #0x40
	movs r1, #0x48
	bl StartHelpBoxExt_Unk
	mov r0, sp
	bl ReadFe6LinkSaveInfo
	adds r3, r4, #4
	mov r2, sp
	movs r1, #7
_080437D8:
	ldm r3!, {r0}
	stm r2!, {r0}
	subs r1, #1
	cmp r1, #0
	bge _080437D8
	ldr r1, _08043808 @ =0x02000C04
	adds r1, #5
	ldr r0, [r5, #0x60]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x19
	bne _0804380C
	mov r1, sp
	movs r0, #2
	b _08043810
	.align 2, 0
_080437F8: .4byte 0x02000C1C
_080437FC: .4byte sub_08043788
_08043800: .4byte 0x06016800
_08043804: .4byte 0x00001195
_08043808: .4byte 0x02000C04
_0804380C:
	mov r1, sp
	movs r0, #1
_08043810:
	strh r0, [r1, #0x20]
	mov r0, sp
	bl WriteFe6LinkSaveInfo
	adds r0, r5, #0
	bl Proc_Break
_0804381E:
	add sp, #0x28
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
