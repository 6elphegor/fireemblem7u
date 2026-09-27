	.include "macro.inc"

	.syntax unified

	thumb_func_start SetBattleMuPalette
SetBattleMuPalette: @ 0x0806EAEC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806EB08 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806EB12
	cmp r0, #2
	beq _0806EB0C
	b _0806EB18
	.align 2, 0
_0806EB08: .4byte 0x0203E0FC
_0806EB0C:
	movs r0, #1
	bl SetBattleMuPaletteByIndex
_0806EB12:
	movs r0, #0
	bl SetBattleMuPaletteByIndex
_0806EB18:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
