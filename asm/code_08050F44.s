	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08050F44
sub_08050F44: @ 0x08050F44
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08050F64 @ =0x0203E00A
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08050F5A
	bl CheckInEkrDragon
	cmp r0, #0
	beq _08050F68
_08050F5A:
	adds r0, r4, #0
	bl Proc_Break
	b _08050F8E
	.align 2, 0
_08050F64: .4byte 0x0203E00A
_08050F68:
	ldr r0, _08050F94 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl UnpackChapterMapGraphics
	movs r0, #0x10
	bl EfxChapterMapFadeOUT
	bl RenderMap
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r4, #0
	bl Proc_Break
_08050F8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050F94: .4byte 0x0202BBF8
