	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08099A48
sub_08099A48: @ 0x08099A48
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r2, #0
	mov r1, sp
	ldr r0, _08099A6C @ =0x0840F410
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #0
	beq _08099A70
	movs r2, #1
	b _08099A90
	.align 2, 0
_08099A6C: .4byte 0x0840F410
_08099A70:
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #1
	beq _08099A90
	cmp r0, #1
	bgt _08099A84
	cmp r0, #0
	beq _08099A8A
	b _08099A90
_08099A84:
	cmp r0, #2
	beq _08099A8E
	b _08099A90
_08099A8A:
	movs r2, #3
	b _08099A90
_08099A8E:
	movs r2, #2
_08099A90:
	lsls r0, r2, #2
	add r0, sp
	ldr r0, [r0]
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _08099AB8
	movs r0, #0x20
	bl ArchivePalette
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl SetPalFadeStClkEnd
_08099AB8:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
