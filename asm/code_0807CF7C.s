	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CF7C
sub_0807CF7C: @ 0x0807CF7C
	push {lr}
	movs r0, #8
	bl GetUnitFromCharId
	adds r1, r0, #0
	movs r0, #0xc0
	ldrb r2, [r1, #0xb]
	ands r0, r2
	cmp r0, #0
	bne _0807CFA0
	ldr r0, _0807CF9C @ =0x00000407
	ldrh r1, [r1, #0x10]
	cmp r1, r0
	bne _0807CFA0
	movs r0, #1
	b _0807CFA2
	.align 2, 0
_0807CF9C: .4byte 0x00000407
_0807CFA0:
	movs r0, #0
_0807CFA2:
	pop {r1}
	bx r1
	.align 2, 0
