	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809AB7C
sub_0809AB7C: @ 0x0809AB7C
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl GetChapterDivinationTextIdHectorStory
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	str r0, [sp]
	ldr r0, _0809ABB8 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809ABBC @ =0x0004000A
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809ABB8: .4byte 0x06011000
_0809ABBC: .4byte 0x0004000A
