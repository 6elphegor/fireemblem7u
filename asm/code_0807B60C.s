	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807B60C
sub_0807B60C: @ 0x0807B60C
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, _0807B68C @ =0x02022C00
	adds r1, r0, #0
	subs r1, #0x40
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	movs r0, #0x1b
	bl ArchivePalette
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r6, #0x80
	lsls r6, r6, #0x14
	str r6, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_080139D8
	movs r0, #0xda
	bl GetUnitFromCharId
	adds r4, r0, #0
	cmp r4, #0
	beq _0807B65E
	adds r1, r5, #0
	bl StartUnitTornOut
	str r6, [r4, #0xc]
_0807B65E:
	movs r0, #0x86
	bl GetUnitFromCharId
	adds r4, r0, #0
	cmp r4, #0
	beq _0807B672
	adds r1, r5, #0
	bl StartUnitTornOut
	str r6, [r4, #0xc]
_0807B672:
	ldr r0, _0807B690 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807B684
	movs r0, #0xd6
	bl m4aSongNumStart
_0807B684:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B68C: .4byte 0x02022C00
_0807B690: .4byte 0x0202BBF8
