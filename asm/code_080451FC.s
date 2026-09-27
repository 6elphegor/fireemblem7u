	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080451FC
sub_080451FC: @ 0x080451FC
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldr r0, _08045214 @ =0x0203D90C
	ldrb r2, [r0]
	cmp r2, #1
	bne _08045218
	ldrb r0, [r0, #0xb]
	cmp r0, #1
	bne _08045228
	b _0804521E
	.align 2, 0
_08045214: .4byte 0x0203D90C
_08045218:
	ldrb r0, [r0, #0xb]
	cmp r0, #2
	bne _08045228
_0804521E:
	adds r0, r3, #0
	movs r1, #3
	bl Proc_Goto
	b _08045282
_08045228:
	ldr r0, _0804523C @ =0x0203DC9C
	ldrb r2, [r0, #1]
	adds r0, r2, #0
	cmp r0, #0xff
	bne _08045240
	adds r0, r3, #0
	movs r1, #2
	bl Proc_Goto
	b _08045282
	.align 2, 0
_0804523C: .4byte 0x0203DC9C
_08045240:
	ldr r0, _08045248 @ =0x0202BBF8
	strb r2, [r0, #0xf]
	ldr r2, _0804524C @ =0x03001400
	b _08045252
	.align 2, 0
_08045248: .4byte 0x0202BBF8
_0804524C: .4byte 0x03001400
_08045250:
	adds r1, #1
_08045252:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08045250
	ldr r4, _08045288 @ =0x0203DC9C
	strb r1, [r4, #2]
	adds r0, r1, #1
	strb r0, [r4, #3]
	bl ApplySystemObjectsGraphics
	movs r0, #0
	adds r4, #0x2c
	movs r1, #3
_0804526C:
	str r0, [r4, #4]
	strb r0, [r4]
	adds r4, #8
	subs r1, #1
	cmp r1, #0
	bge _0804526C
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #9
	bl SetupDebugFontForOBJ
_08045282:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08045288: .4byte 0x0203DC9C
